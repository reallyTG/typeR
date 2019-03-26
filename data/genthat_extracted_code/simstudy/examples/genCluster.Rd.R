library(simstudy)


### Name: genCluster
### Title: Simulate clustered data
### Aliases: genCluster

### ** Examples

gen.school <- defData(varname="s0", dist = "normal",
 formula = 0, variance = 3, id = "idSchool"
)
gen.school <- defData(gen.school, varname = "nClasses",
                     dist = "noZeroPoisson", formula = 3
)

dtSchool <- genData(3, gen.school)#'
dtSchool

dtClass <- genCluster(dtSchool, cLevelVar = "idSchool",
                      numIndsVar = "nClasses", level1ID = "idClass")
dtClass



