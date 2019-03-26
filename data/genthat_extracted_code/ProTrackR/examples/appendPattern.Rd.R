library(ProTrackR)


### Name: appendPattern
### Title: Append a PTPattern to a PTModule
### Aliases: appendPattern appendPattern,PTModule,PTPattern-method

### ** Examples

data("mod.intro")

## append an empty pattern to mod.intro

mod.intro <- appendPattern(mod.intro, new("PTPattern"))

## append a copy of pattern # 1 (this is pattern #0 in the
## patternOrder table) to mod.intro

mod.intro <- appendPattern(mod.intro, PTPattern(mod.intro, 1))




