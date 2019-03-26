library(lfl)


### Name: perceive
### Title: From a set of rules, remove each rule for which another rule
###   exists that is more specific.
### Aliases: perceive
### Keywords: models robust

### ** Examples

# prepare vars
v <- c(rep('a', 3),
       rep('b', 3),
       rep('c', 3),
       rep('d', 3))
names(v) <- paste(rep(c('VeSm', 'Sm', 'Bi'), times=4),
                  rep(c('a', 'b', 'c', 'd'), each=3),
                  sep='.')
print(v)

# prepare specs
s <- matrix(c(0,1,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,

              0,0,0, 0,1,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,

              0,0,0, 0,0,0, 0,1,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,

              0,0,0, 0,0,0, 0,0,0, 0,1,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0,
              0,0,0, 0,0,0, 0,0,0, 0,0,0),
          byrow=TRUE,
          ncol=12)
colnames(s) = names(v)
rownames(s) = names(v)
print(s)

# run perceive function: (Sm.a, Bi.c) has
# more specific rule (VeSm.a, Bi.c)
perceive(list(c('Sm.a', 'Bi.c'), 
              c('VeSm.a', 'Bi.c'),
              c('Sm.b', 'Sm.d')),
         v, s)



