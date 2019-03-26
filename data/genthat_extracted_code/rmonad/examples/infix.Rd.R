library(rmonad)


### Name: infix
### Title: Infix operators
### Aliases: infix %>>% %v>% %*>% %>_% %>^% %^>% %|>% %||% %__%

### ** Examples

256 %>>% sqrt
256 %v>% sqrt
list(1,2,3) %*>% sum
iris %>_% plot %>>% summary 
1:10 %>^% rgamma(10, 5) %>^% rgamma(10, 6) %^>% cor
1:10 %>>% colSums %|>% sum
stop("die") %||% 4 %>>% sqrt
16 %>>% sqrt %__% 25 %>>% sqrt



