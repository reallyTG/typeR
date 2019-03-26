library(ProTrackR)


### Name: deletePattern
### Title: Remove a PTPattern table from a PTModule object
### Aliases: deletePattern deletePattern,PTModule,numeric-method

### ** Examples

data("mod.intro")
print(mod.intro)

## delete pattern #2 from mod.intro:

mod.intro <- deletePattern(mod.intro, 2)
print(mod.intro)




