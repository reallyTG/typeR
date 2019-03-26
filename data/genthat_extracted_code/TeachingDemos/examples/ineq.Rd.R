library(TeachingDemos)


### Name: %<%
### Title: Less than or Less than and equal operators that can be chained
###   together.
### Aliases: %<% %<=%
### Keywords: manip logic

### ** Examples


x <- -3:3

 -2 %<% x %<% 2
c( -2 %<% x %<% 2 )
x[ -2 %<% x %<% 2 ]
x[ -2 %<=% x %<=% 2 ]


x <- rnorm(100)
y <- rnorm(100)

x[ -1 %<% x %<% 1 ]
range( x[ -1 %<% x %<% 1 ] )


cbind(x,y)[ -1 %<% x %<% y %<% 1, ]
cbind(x,y)[ (-1 %<% x) %<% (y %<% 1), ]
cbind(x,y)[ ((-1 %<% x) %<% y) %<% 1, ]
cbind(x,y)[ -1 %<% (x %<% (y %<% 1)), ]
cbind(x,y)[ -1 %<% (x %<% y) %<% 1, ] # oops


3 
3 





