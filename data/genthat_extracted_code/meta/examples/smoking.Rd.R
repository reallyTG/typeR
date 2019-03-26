library(meta)


### Name: smoking
### Title: Smoking example
### Aliases: smoking lungcancer
### Keywords: datasets

### ** Examples

data(smoking)

m1 <- metainc(d.smokers, py.smokers,
              d.nonsmokers, py.nonsmokers,
              data=smoking, studlab=study)
print(m1, digits=2)

data(lungcancer)

m2 <- metainc(d.smokers, py.smokers,
              d.nonsmokers, py.nonsmokers,
              data=lungcancer, studlab=study)
print(m2, digits=2)



