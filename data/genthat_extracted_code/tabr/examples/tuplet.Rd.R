library(tabr)


### Name: tuplet
### Title: Tuplets
### Aliases: tuplet triplet

### ** Examples

tuplet("c c# d", 8)
triplet("c c# d", 8)
tuplet("c c# d c c# d", 4, a = 6, b = 4)

p1 <- phrase("c c# d", "8] 8( 8)", "5*3")
tuplet(p1, 8)



