library(abd)


### Name: ElectricFish
### Title: Electric Fish
### Aliases: ElectricFish
### Keywords: datasets

### ** Examples

ElectricFish
require(grid)
xyplot(species.upstream ~ species.downstream, data = ElectricFish,
  panel=function(x, y, ...){
    grid.text(ElectricFish$tributary, x=x, y=y,
      rot = 45,
      gp = gpar(cex=.6),
      default.units = 'native')
    }
  )



