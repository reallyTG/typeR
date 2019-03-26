library(nonmemica)


### Name: datafile.character
### Title: Identify the Datafile for a Model
### Aliases: datafile.character

### ** Examples

library(spec)
source <- system.file(package = 'nonmemica','project')
target <- tempdir()
target <- gsub('\\\\','/',target) # for windows
file.copy(source,target,recursive = TRUE)
project <- file.path(target,'project','model')
options(project = project)
library(magrittr)
1001 %>% datafile
datafile(1001) %matches% specfile(1001)
1001 %>% specfile
1001 %>% specfile %>% read.spec



