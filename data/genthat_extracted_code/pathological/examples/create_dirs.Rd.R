library(pathological)


### Name: create_dirs
### Title: Create or remove files and directories
### Aliases: create_dirs create_files remove_dirs

### ** Examples

## No test: 
dirs <- temp_dir(c("foo", "bar/baz"))
create_dirs(dirs)

# Check this worked:
assertive.files::assert_all_are_dirs(dirs)

files <- temp_dir("blah/blah/blah", LETTERS)
create_files(files)

assertive.files::assert_all_are_existing_files(files)

# Clean up
remove_dirs(temp_dir(c("foo", "bar", "blah")))
## End(No test)



