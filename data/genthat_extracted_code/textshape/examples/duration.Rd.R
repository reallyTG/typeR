library(textshape)


### Name: duration
### Title: Duration of Turns of Talk
### Aliases: duration duration.default duration.data.frame duration.numeric
###   starts ends

### ** Examples

(x <- c(
    "Mr. Brown comes! He says hello. i give him coffee.",
    "I'll go at 5 p. m. eastern time.  Or somewhere in between!",
    "go there"
))
duration(x)
group <- c("A", "B", "A")
duration(x, group)

groups <- list(group1 = c("A", "B", "A"), group2 = c("red", "red", "green"))
duration(x, groups)

data(DATA)
duration(DATA)

## Larger data set
duration(hamlet)

## Integer values
x <- sample(1:10, 10)
duration(x)
starts(x)
ends(x)



