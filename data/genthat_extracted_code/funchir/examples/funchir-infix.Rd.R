library(funchir)


### Name: funchir-infix
### Title: Convenient Infix Operators
### Aliases: %+% %% '%<unescaped bksl>%' %u% %^%

### ** Examples

  directory <- "~/some/directory/"
  fil <- "some_file.ext"
  # very convenient for repeated calls to a directory outside getwd()
  directory %+% fil  

  set1 <- 1:5
  set2 <- 4:6

  set1 %% set2 # c(1,2,3)
  set1 %u% set2 # c(1,2,3,4,5,6)
  set1 %^% set2 # c(4,5)



