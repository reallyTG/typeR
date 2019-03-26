library(TaoTeProgramming)


### Name: P.backcolor
### Title: Tao Te Programming illustrations
### Aliases: P.backcolor P.bend01 P.bend03 P.bend04 P.bend05
###   P.butterflies01 P.butterflies02 P.chess P.chess02 P.chess03
###   P.frontcolor P.hillscene01 P.mountscene01 P.mountscene02
###   P.mountscene03 P.mountscene04 P.polyhull01 P.polysort01 P.polytile01
###   P.polytile02 P.polytile03 P.polytile04 P.polytile05 P.quadtile01
###   P.quadtile02 P.quadtile03 P.quadtile04 P.roads01 P.roads02 P.sticks01
###   P.sticks02 P.sticks03 P.sticks04 P.template P.tree01 P.tree02
###   P.tree03 P.tritile01 P.tritile02 P.tritile03 P.wave01 P.wave02
###   P.wavescene01 P.wavescene02 P.wavescene03
### Keywords: hplot

### ** Examples

P.backcolor(NULL)

# see all the specific plot functions
ls("package:TaoTeProgramming", pattern='^P')

# view a random plot
get(sample(ls("package:TaoTeProgramming", pattern='^P')))(NULL)



