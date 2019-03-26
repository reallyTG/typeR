library(agricolae)


### Name: design.ab
### Title: Design of experiments for a factorial
### Aliases: design.ab
### Keywords: design

### ** Examples

# factorial 3 x 2 with 3 blocks
library(agricolae)
trt<-c(3,2) # factorial 3x2
outdesign <-design.ab(trt, r=3, serie=2)
book<-outdesign$book
head(book,10) # print of the field book
# factorial 2 x 2 x 2 with 5 replications in completely randomized design.
trt<-c(2,2,2)
outdesign<-design.ab(trt, r=5, serie=2,design="crd")
book<-outdesign$book
print(book)
# factorial 3 x 3 in latin square design.
trt <-c(3,3)
outdesign<-design.ab(trt, serie=2, design="lsd")
book<-outdesign$book
print(book)



