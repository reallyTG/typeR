library(lava)


### Name: backdoor
### Title: Backdoor criterion
### Aliases: backdoor

### ** Examples

m <- lvm(y~c2,c2~c1,x~c1,m1~x,y~m1, v1~c3, x~c3,v1~y,
         x~z1, z2~z1, z2~z3, y~z3+z2+g1+g2+g3)
ll <- backdoor(m, y~x)
backdoor(m, y~x|c1+z1+g1)



