library(pathological)


### Name: choose_dir
### Title: Choose files interactively
### Aliases: choose_dir choose_files

### ** Examples

## No test: 
if(interactive())
{
  choose_files()
  if(assertive.reflection::is_windows())
  {
    choose_dir()
  }
}
## End(No test)



