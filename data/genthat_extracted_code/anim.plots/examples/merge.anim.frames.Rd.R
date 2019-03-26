library(anim.plots)


### Name: merge.anim.frames
### Title: Merge anim.frames objects
### Aliases: merge.anim.frames

### ** Examples

tmp <- anim.plot(1:5, 1:5, speed=2)
tmp2 <- anim.plot(1:5, 5:1, col="red", speed=2)
## Not what you want:
replay(merge(tmp, tmp2))

## better:
tmp3 <- anim.points(1:5, 5:1,col="red", speed=2)
newf <- merge(tmp, tmp3)
replay(newf)
## NB: result of the merge looks different from the two
## individual animations

## not the same:
newf2 <- merge(tmp2, tmp) 
## points will be called before plot!
replay(newf2)



