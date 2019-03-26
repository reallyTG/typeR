library(PowerTOST)


### Name: CVpooled
### Title: Pooled CV from several studies
### Aliases: CVpooled print.CVp

### ** Examples

# some data:
# the values for AUC, study 1 and study 2 are Example 3 of H.Schuetz' lecture
CVs <- ("
 PKmetric | CV   |  n |design| source
    AUC   | 0.20 | 24 | 2x2  | study 1
    Cmax  | 0.25 | 24 | 2x2  | study 1
    AUC   | 0.30 | 12 | 2x2  | study 2
    Cmax  | 0.31 | 12 | 2x2  | study 2
    AUC   | 0.25 | 12 | 2x2x4| study 3 (full replicate)
")
txtcon <- textConnection(CVs)
CVdata <- read.table(txtcon, header=TRUE, sep="|", strip.white=TRUE, as.is=TRUE)
close(txtcon)

# evaluation of the AUC CVs
CVsAUC <- subset(CVdata, PKmetric=="AUC")
CVpooled(CVsAUC, alpha=0.2, logscale=TRUE)
# df of the 'robust' evaluation
CVpooled(CVsAUC, alpha=0.2, logscale=TRUE, robust=TRUE)
# print also the upper CL, data example 3
CVsAUC3 <- subset(CVsAUC,design != "2x2x4")
print(CVpooled(CVsAUC3, alpha=0.2, robust=TRUE), digits=3, verbose=TRUE)
# will give the output:
# Pooled CV = 0.235 with 32 degrees of freedom (robust df's)
# Upper 80% confidence limit of CV = 0.266
#
# Combining CVs from studies evaluated by ANOVA (robust=FALSE) and
# by a mixed effects model (robust=TRUE). dfs have to be provided!
CVs <- ("
  CV    |  n |design| source  | model | df
  0.212 | 24 | 2x2  | study 1 | fixed | 22
  0.157 | 27 | 3x3  | study 2 | fixed | 50
  0.148 | 27 | 3x3  | study 3 | mixed | 24
")
txtcon <- textConnection(CVs)
CVdata <- read.table(txtcon, header=TRUE, sep="|", strip.white=TRUE, as.is=TRUE)
close(txtcon)
print(CVpooled(CVdata, alpha=0.2), digits=3, verbose=TRUE)
# will give the output:
# Pooled CV = 0.169 with 96 degrees of freedom
# Upper 80% confidence limit of CV = 0.181



