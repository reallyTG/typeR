library(ndtv)


### Name: effectFun
### Title: functions to manipulate graphic attributes of network for
###   'special effects'
### Aliases: effectFun effects effect.edgeAgeColor effect.vertexAgeColor

### ** Examples

library(ndtv)
data('short.stergm.sim')
# render a plot with edges colored by age at time 24
# edges labeld with age
plot(short.stergm.sim,edge.col=effect.edgeAgeColor(short.stergm.sim,
                                                   fade.dur=25,
                                                   start.color = 'red',
                                                   end.color='blue', 
                                                   onset=24),
     edge.label=edges.age.at(short.stergm.sim,24),
     edge.lwd=5)
     
## Not run: 
##D # render an animation where edges are colored dynamically by their age
##D # starting out red and fading to blue
##D compute.animation(short.stergm.sim,slice.par = list(start=0,
##D                                                    end=25,
##D                                                    interval=1, a
##D                                                    ggregate.dur=5,
##D                                                    rule='latest'))
##D render.animation(short.stergm.sim,edge.col=effectFun('edgeAgeColor',
##D                                                       fade.dur=5,
##D                                                       start.color = 'red',
##D                                                       end.color='blue'))
## End(Not run)     




