library(nonmemica)


### Name: tweak.model
### Title: Tweak Model
### Aliases: tweak.model

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

# Make ten new models with slightly different initial estimates.
1001 %>% tweak



