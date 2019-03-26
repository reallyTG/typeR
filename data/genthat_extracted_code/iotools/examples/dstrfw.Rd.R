library(iotools)


### Name: dstrfw
### Title: Split fixed width input into a dataframe
### Aliases: dstrfw
### Keywords: manip

### ** Examples

input = c("bear\t22.7horse+3", "pear\t 3.4mouse-3", "dogs\t14.8prime-8")
z = dstrfw(x = input, col_types = c("numeric", "character", "integer"),
      width=c(4L,5L,2L), nsep="\t")
z

# Now without row names (treat seperator as a 1 char width column with type NULL)
z = dstrfw(x = input,
    col_types = c("character", "NULL", "numeric", "character", "integer"),
    width=c(4L,1L,4L,5L,2L))
z



