library(lava)


### Name: dsep.lvm
### Title: Check d-separation criterion
### Aliases: dsep.lvm dsep

### ** Examples

m <- lvm(x5 ~ x4+x3, x4~x3+x1, x3~x2, x2~x1)
if (interactive()) {
plot(m,layoutType='neato')
}
dsep(m,x5~x1|x2+x4)
dsep(m,x5~x1|x3+x4)
dsep(m,~x1+x2+x3|x4)




