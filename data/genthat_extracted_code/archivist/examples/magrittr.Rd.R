library(archivist)


### Name: %a%
### Title: magrittr - a Forward-Pipe Operator for R
### Aliases: %a%

### ** Examples

## Not run: 
##D 
##D library("dplyr")
##D 
##D ## Usage of %a% operator without setting default repository
##D # We will receive sepcial warning
##D iris %a% summary()
##D 
##D ## Archiving artifacts with their chaining code
##D # Creating empty repository
##D exampleRepoDir <- tempfile()
##D createLocalRepo( exampleRepoDir, default = TRUE ) # Remember to set repo to default
##D 
##D # Start using %a% operator
##D data("hflights", package = "hflights")
##D hflights %a%
##D   group_by(Year, Month, DayofMonth) %a%
##D   select(Year:DayofMonth, ArrDelay, DepDelay) %a%
##D   summarise(arr = mean(ArrDelay, na.rm = TRUE),
##D             dep = mean(DepDelay, na.rm = TRUE)) %a%
##D   filter(arr > 30 | dep > 30)
##D   
##D # Let's check how Tags of subsequent artifacts look like
##D showLocalRepo()
##D getTagsLocal("a8ce013a8e66df222be278122423dc60", tag = "") #1
##D getTagsLocal("9d91fe67fd51f3bfdc9db0a596b12b38", tag = "") #2
##D getTagsLocal("617ded4953ac986524a1c24703363980", tag = "") #3
##D getTagsLocal("3f1ac0a27485be5d52e1b0a41d165abc", tag = "") #4
##D getTagsLocal("0cb04315482de73d7f5a1081953236f8", tag = "") #5
##D getTagsLocal("5629bc43e36d219b613076b17c665eda", tag = "") #6
##D 
##D # Deleting existing repository
##D deleteLocalRepo(exampleRepoDir, deleteRoot = TRUE)
##D rm(exampleRepoDir) 
## End(Not run)



