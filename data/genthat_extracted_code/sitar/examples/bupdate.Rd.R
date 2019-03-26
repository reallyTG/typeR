library(sitar)


### Name: bupdate
### Title: Update the b fixed effect to minimise the b-c random effect
###   correlation
### Aliases: bupdate
### Keywords: regression

### ** Examples


## fit sitar model with b fixed effect starting value defaulting to 'mean'
m1 <- sitar(x=age, y=height, id=id, data=heights, df=5)
print(fixef(m1)['b'])

## refit with starting value chosen to minimise b-c correlation and df increased
m2 <- update(m1, bstart=bupdate(m1), df=6)
print(fixef(m2)['b'])




