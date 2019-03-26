library(PMwR)


### Name: quote32
### Title: Treasury Quotes with 1/32nds of Point
### Aliases: quote32 q32

### ** Examples

quote32(100 + 17/32 + 0.75/32)
q32("100-172")

q32("100-272") - q32("100-270")
as.numeric(q32("100-272") - q32("100-270"))



