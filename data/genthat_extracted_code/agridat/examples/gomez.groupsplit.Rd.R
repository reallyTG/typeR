library(agridat)


### Name: gomez.groupsplit
### Title: Group balanced split-plot design in rice
### Aliases: gomez.groupsplit

### ** Examples


data(gomez.groupsplit)
dat <- gomez.groupsplit

# Gomez figure 3.10.  Obvious fert and group effects
if(require(desplot)){
  desplot(group ~ col*row, dat,
          out1=rep, col=fert, text=gen, # aspect unknown
          main="gomez.groupsplit")
}

# Gomez table 3.19 (not partitioned by group)
m1 <- aov(yield ~ fert*group + gen:group + fert:gen:group +
            Error(rep/fert/group), data=dat)
summary(m1)



