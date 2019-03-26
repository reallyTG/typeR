library(nonmemica)


### Name: likebut
### Title: Modify a Model
### Aliases: likebut

### ** Examples

# Create a working project.
source <- system.file(package = 'nonmemica','project')
target <- tempdir()
target <- gsub('\\\\','/',target) # for windows
source
target
file.copy(source,target,recursive = TRUE)
project <- file.path(target,'project','model')

# Point project option at working project
options(project = project)
library(magrittr)

# Derive models.
1001 %>% likebut('revised',y = 1002, overwrite=TRUE )

# At this point, edit 1002.ctl to match whatever 'revised' means.
# Then run it with NONMEM.



