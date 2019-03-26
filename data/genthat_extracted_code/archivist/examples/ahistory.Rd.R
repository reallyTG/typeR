library(archivist)


### Name: ahistory
### Title: Show Artifact's History
### Aliases: ahistory

### ** Examples


createLocalRepo("ahistory_check", default = TRUE)
library(dplyr)
iris %a%
filter(Sepal.Length < 6) %a%
 lm(Petal.Length~Species, data=.) %a%
 summary() -> artifact
 
ahistory(artifact)
ahistory(artifact, format = "kable")  
print(ahistory(artifact, format = "kable"), format = "latex")
ahistory(artifact, format = "kable", alink = TRUE, repoDir = "ahistory_check",
repo = "repo", user = "user")


repoDir <- file.path(getwd(), "ahistory_check")
deleteLocalRepo(repoDir, deleteRoot = TRUE)
aoptions('repoDir', NULL, unset = TRUE)




