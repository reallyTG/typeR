library(BSDA)


### Name: Kidsmoke
### Title: Smoking habits of boys and girls ages 12 to 18
### Aliases: Kidsmoke
### Keywords: datasets

### ** Examples


T1 <- xtabs(~smoke + gender, data = Kidsmoke)
T1
prop.table(T1)
prop.table(T1, 1)
prop.table(T1, 2)




