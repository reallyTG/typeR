library(hyper.fit)


### Name: hyper.convert
### Title: Parameterisation conversion functions.
### Aliases: hyper.convert convert.hyper.plane.param convert
### Keywords: convert hyper

### ** Examples


#Here we are assuming our plane forula is z=2x+3y+1 plus Gaussian intrinsic scatter along
#z with sd=4:

excoord.alpha=c(2,3)
exbeta.vert.axis=1
exscat.vert.axis=4

print(hyper.convert(coord=excoord.alpha, beta=exbeta.vert.axis, scat=exscat.vert.axis,
out.coord.type='theta', out.scat.type='orth'))
print(hyper.convert(coord=excoord.alpha, beta=exbeta.vert.axis, scat=exscat.vert.axis,
out.vert.axis=2))

#To simplify conversions and reduce mistakes you can use the class dependent method:
temp=hyper.convert(coord=excoord.alpha, beta=exbeta.vert.axis, scat=exscat.vert.axis)
print(convert(temp, coord.type='normvec')$parm)
print(convert(temp, coord.type='theta')$parm)
print(convert(temp, coord.type='theta', vert.axis=2)$parm)
print(convert(temp, coord.type='theta', scat.type='orth')$parm)
#We can check the conversions by
print(temp$parm)
print(convert(convert(convert(convert(temp, 'normvec'), 'theta', 'vert.axis',1), 'alpha',
'orth', 2))$parm)

#The conversions back and forth won't return *exactly* the same values:
print(all(convert(convert(convert(convert(temp, 'normvec'), 'theta', 'vert.axis', 1),'alpha',
'orth', 2))$parm==temp$parm))
#But they will be very close for the most part:
print(all(round(convert(convert(convert(convert(temp, 'normvec'), 'theta', 'vert.axis', 1),
'alpha', 'orth', 2))$parm)==temp$parm))



