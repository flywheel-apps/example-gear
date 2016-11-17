#!/usr/bin/env bash
(
  #
  # create file_list.txt with one line per filename in input.
  #


  # Set cwd
  unset CDPATH
  cd "$( dirname "${BASH_SOURCE[0]}" )"
  
  dest="/flywheel/v0/output/result.txt"

  # Create a sample output file with some information.
  echo "Welcome to the example gear!" > $dest
  echo >> $dest
  echo "Your configuration:" >> $dest
  cat /flywheel/v0/config.json >> $dest
  echo >> $dest
  echo "Your chosne files:" >> $dest
  ls -1 "/flywheel/v0/input" >> $dest
  echo >> $dest
  echo "The end!" >> $dest
  
  # Print out the results for demonstration purposes.
  cat $dest

  # .metadata.json required to indicate gear completed successfully.
  echo '{ "acquisition" : { "files" : [{ "name" : "result.txt" }] } }' > "/flywheel/v0/output/.metadata.json"
)
