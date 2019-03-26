library(sfsmisc)


### Name: lseq
### Title: Generate Sequences, Equidistant on Log Scale
### Aliases: lseq
### Keywords: manip

### ** Examples

(x <- lseq(1, 990, length= 21))
plot(x, x^4,    type = "b", col = 2, log = "xy")
if(with(R.version, major >= 2 && minor >= 1))
plot(x, exp(x), type = "b", col = 2, log = "xy")



