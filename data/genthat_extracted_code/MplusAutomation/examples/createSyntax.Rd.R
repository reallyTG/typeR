library(MplusAutomation)


### Name: createSyntax
### Title: Create the Mplus input text for an mplusObject
### Aliases: createSyntax
### Keywords: interface

### ** Examples

# example mplusObject
example1 <- mplusObject(MODEL = "mpg ON wt;",
  usevariables = c("mpg", "hp"), rdata = mtcars)

# create the Mplus input text
cat(createSyntax(example1, "example1.dat"), file=stdout(), fill=TRUE)

# update the object, then create input text
cat(createSyntax(update(example1,
  TITLE = ~ "This is my title;",
  MODEL = ~ . + "\nmpg ON hp;",
  usevariables = c("mpg", "hp", "wt")), "example1.dat"),
  file=stdout(),
  fill=TRUE)
rm(example1)



