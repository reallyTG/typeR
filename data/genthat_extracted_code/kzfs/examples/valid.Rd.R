library(kzfs)


### Name: kzpdr.valid
### Title: Validate Estimated Wave Parameters Under Given Tolerance Setting
### Aliases: kzpdr.valid
### Keywords: directional-periodogram

### ** Examples


# load pre-saved data 
data(kzpdr.demo)

# validation
kzpdr.valid(kzpdr.demo, t.D = 2, t.F = 0.01, level = 1)



