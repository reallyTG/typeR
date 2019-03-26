library(ProTrackR)


### Name: fix.PTModule
### Title: Attempt to fix PTModule to ProTracker specs
### Aliases: fix.PTModule fix.PTModule,PTModule,logical-method
###   fix.PTModule,PTModule,missing-method

### ** Examples

## Not run: 
##D data("mod.intro")
##D 
##D ## Let's do something illegal and destroy mod.intro:
##D mod.intro@pattern.order <- mod.intro@pattern.order[1:9]
##D 
##D ## We should have used the 'patternOrder'-method to
##D ## change the pattern order. Now we have broken the
##D ## object:
##D validObject(mod.intro, TRUE)
##D 
##D ## No worries, we can fix it:
##D mod.intro <- fix.PTModule(mod.intro)
##D 
##D ## See, it's all OK again:
##D validObject(mod.intro, TRUE)
## End(Not run)



