library(sdcTable)


### Name: protectLinkedTables
### Title: protect two 'sdcProblem-class' objects that have common cells
### Aliases: protectLinkedTables

### ** Examples

## Not run: 
##D # load micro data for further processing
##D sp <- searchpaths()
##D fn <- paste(sp[grep("sdcTable", sp)], "/data/microData2.RData", sep="")
##D microData <- get(load(fn))
##D 
##D # table1: defined by variables 'gender' and 'ecoOld'
##D microData1 <- microData[,c(2,3,5)]
##D 
##D # table2: defined by variables 'region', 'gender' and 'ecoNew'
##D microData2 <- microData[,c(1,2,4,5)]
##D 
##D # we need to create information on the hierarchies
##D # variable 'region': exists only in microDat2
##D d_region <- hier_create(root = "Tot", nodes = c("R1", "R2"))
##D 
##D # variable 'gender': exists in both datasets
##D d_gender <- hier_create(root = "Tot", nodes = c("m", "f"))
##D 
##D # variable 'eco1': exists only in microDat1
##D d_eco1 <- hier_create(root = "Tot", nodes = c("A", "B"))
##D d_eco1 <- hier_add(d_eco1, root = "A", nodes = c("Aa", "Ab"))
##D d_eco1 <- hier_add(d_eco1, root = "B", nodes = c("Ba", "Bb"))
##D 
##D # variable 'ecoNew': exists only in microDat2
##D d_eco2 <- hier_create(root = "Tot", nodes = c("C", "D"))
##D d_eco2 <- hier_add(d_eco2, root = "C", nodes = c("Ca", "Cb", "Cc"))
##D d_eco2 <- hier_add(d_eco2, root = "D", nodes = c("Da", "Db", "Dc"))
##D 
##D # creating objects holding information on dimensions
##D dl1 <- list(gender = d_gender, ecoOld = d_eco1)
##D dl2 <- list(region = d_region, gender = d_gender, ecoNew = d_eco2)
##D 
##D # creating input objects for further processing. For details have a look at
##D # \code{makeProblem}.
##D p1 <- makeProblem(
##D   data = microData1, 
##D   dimList = dl1, 
##D   dimVarInd = 1:2,
##D   numVarInd = 3
##D )
##D p2 <- makeProblem(
##D   data = microData2, 
##D   dimList = dl2, 
##D   dimVarInd = 1:3,
##D   numVarInd = 4
##D )
##D 
##D # the cell specified by gender == "Tot" and ecoOld == "A"
##D # is one of the common cells! -> we mark it as primary suppression
##D p1 <- changeCellStatus(
##D   object = p1, 
##D   characteristics = c("Tot", "A"),
##D   varNames = c("gender", "ecoOld"), 
##D   rule = "u", 
##D   verbose = FALSE
##D )
##D 
##D # the cell specified by region == "Tot" and gender == "f" and ecoNew == "C"
##D # is one of the common cells! -> we mark it as primary suppression
##D p2 <- changeCellStatus(
##D   object = p2, 
##D   characteristics = c("Tot", "f", "C"),
##D   varNames = c("region", "gender", "ecoNew"), 
##D   rule = "u", 
##D   verbose = FALSE
##D )
##D 
##D # specifying input to define common cells
##D common_cells <- list()
##D 
##D # variable "gender"
##D common_cells$v.gender <- list()
##D common_cells$v.gender[[1]] <- "gender" # variable name in "p1"
##D common_cells$v.gender[[2]] <- "gender" # variable name in "p2"
##D # "gender" has equal characteristics on both datasets -> keyword "ALL"
##D common_cells$v.gender[[3]] <- "ALL"
##D 
##D # variables: "ecoOld" and "ecoNew"
##D common_cells$v.eco <- list()
##D common_cells$v.eco[[1]] <- "ecoOld"   # variable name in "p1"
##D common_cells$v.eco[[2]] <- "ecoNew"   # variable name in "p2"
##D 
##D # vector of common characteristics: "A" and "B" in variable "ecoOld" in 'p1'
##D common_cells$v.eco[[3]] <- c("A", "B")
##D # correspond to characteristics "C" and "D" in variable "ecoNew" in "p2"
##D common_cells$v.eco[[4]] <- c("C", "D")
##D 
##D # protect the linked data
##D result <- protectLinkedTables(
##D   objectA = p1, 
##D   objectB = p2, 
##D   commonCells = common_cells, 
##D   method = "HITAS", 
##D   verbose = TRUE
##D )
##D 
##D # having a look at the results
##D result.tab1 <- result[[1]]
##D result.tab2 <- result[[2]]
##D summary(result.tab1)
##D summary(result.tab2)
## End(Not run)




