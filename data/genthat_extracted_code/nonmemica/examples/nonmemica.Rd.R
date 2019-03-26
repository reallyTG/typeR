library(nonmemica)


### Name: nonmemica
### Title: Create and Evaluate NONMEM Models in a Project Context
### Aliases: nonmemica nonmemica-package

### ** Examples

## No test: 
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

# Load some packages
library(magrittr)
library(metaplot)
library(wrangle)
library(spec)
library(dplyr,warn.conflicts = FALSE)

# Identify features of a model.
1001 %>% modelpath
1001 %>% modeldir
1001 %>% modelfile
1001 %>% modelpath('xml')
1001 %>% datafile
datafile(1001) %matches% specfile(1001)
1001 %>% specfile
1001 %>% specfile %>% read.spec
1001 %>% as.model
1001 %>% as.model %>% comments
1001 %>% definitions
1001 %>% runlog(TRUE)
1001 %>% runlog
1001 %>% partab
1001 %>% num_parameters
1001 %>% nms_canonical
1001 %>% nms_psn
1001 %>% nms_nonmem
1001 %>% parameters
1001 %>% errors
1001 %>% as.model %>% initial
1001 %>% as.model %>% lower
1001 %>% as.model %>% upper
1001 %>% as.model %>% fixed
1001 %>% meta %>% class
1001 %>% meta

# Derive datasets.
1001 %>% superset %>% head
1001 %>% superset %>% filter(VISIBLE == 1) %>% group_by(ID,TIME) %>% status
1001 %>% metasuperset(c('ID','TIME')) %>% head
1001 %>% metasuperset(c('ID','TIME')) %>% sapply(attr,'label')

# Make diagnostic plots.
1001 %>% metaplot(
 CWRESI, TAD, SEX, 
 groups = c('ID','TIME'), 
 subset = 'MDV == 0',
 yref=0, 
 ysmooth = TRUE
)
1001 %>% metaplot(
 ETA1, SEX, 
 ref = 0,
 groups = c('ID','TIME'),
 subset = 'MDV == 0'
)
1001 %>% metaplot(
 SEX, ETA1, 
 ref = 0,
 groups = c('ID','TIME'),
 subset = 'MDV == 0'
)
1001 %>% metaplot(
 ETA1, ETA2, ETA3,
 groups = c('ID','TIME'),
 subset = 'MDV == 0'
)

# Derive models.
1001 %>% likebut('revised',y = 1002, overwrite=TRUE )
# At this point, edit 1002.ctl to match whatever 'revised' means.
# Then run it with NONMEM and post-process results as above.

# Make ten new models with slightly different initial estimates.
1001 %>% tweak
## End(No test)



