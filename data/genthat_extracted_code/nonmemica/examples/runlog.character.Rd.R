library(nonmemica)


### Name: runlog.character
### Title: Create a Runlog for Character
### Aliases: runlog.character

### ** Examples

library(magrittr)
options(project = system.file('project/model',package='nonmemica'))
# likebut(2001,'2 cmt', 2002)              # edit manually, then ...
# likebut(2002,'add. err.', 2003)          # edit manually, then ...
# likebut(2003,'allo. WT on CL',2004)      # edit manually, then ...
# likebut(2004,'estimate allometry', 2005) # edit manually, then ...
# likebut(2005,'SEX on CL', 2006)          # edit manually, then ...
# likebut(2006,'full block omega', 2007)   # edit manually, then run all
2007 %>% runlog(dependencies = TRUE)



