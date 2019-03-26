library(peptider)


### Name: libscheme
### Title: Get the specified library scheme
### Aliases: libscheme

### ** Examples

libscheme("NNN")
libscheme("NNK", 2)

# Build a custom 20/20 library
custom <- data.frame(class = c("A", "Z"), aacid = c("SLRAGPTVIDEFHKNQYMW", "*"), c = c(1, 0))
libscheme(custom)



