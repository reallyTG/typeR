library(sjmisc)


### Name: big_mark
### Title: Format numbers
### Aliases: big_mark prcn

### ** Examples

# simple big mark
big_mark(1234567)

# big marks for several values at once, mixed numeric and character
big_mark(c(1234567, "55443322"))

# pre-defined width of character output
big_mark(c(1234567, 55443322), width = 15)

# convert numbers into percentage, as character
prcn(0.2389)
prcn(c(0.2143887, 0.55443, 0.12345))

dat <- data.frame(
  a = c(.321, .121, .64543),
  b = c("a", "b", "c"),
  c = c(.435, .54352, .234432)
)
prcn(dat)




