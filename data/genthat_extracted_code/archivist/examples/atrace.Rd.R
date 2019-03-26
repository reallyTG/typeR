library(archivist)


### Name: atrace
### Title: Add Tracing For All Objects Created By Given Function
### Aliases: atrace

### ** Examples

# read the object from local directory
createLocalRepo("arepo_test", default=TRUE)
atrace("lm", "z")
lm(Sepal.Length~Sepal.Width, data=iris)
asearch("class:lm")
untrace("lm")



