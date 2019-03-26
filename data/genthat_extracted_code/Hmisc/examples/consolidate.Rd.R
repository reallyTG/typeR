library(Hmisc)


### Name: consolidate
### Title: Element Merging
### Aliases: consolidate consolidate<- consolidate.default
### Keywords: utilities

### ** Examples

x <- 1:5
names(x) <- LETTERS[x]

y <- 6:10
names(y) <- LETTERS[y-2]

x                  # c(A=1,B=2,C=3,D=4,E=5)
y                  # c(D=6,E=7,F=8,G=9,H=10)

consolidate(x, y)      # c(A=1,B=2,C=3,D=6,E=7,F=8,G=9,H=10)
consolidate(x, y, protect=TRUE)      # c(A=1,B=2,C=3,D=4,E=5,F=8,G=9,H=10)




