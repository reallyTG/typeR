library(colorSpec)


### Name: ptransform
### Title: make a linear transformation to a colorSpec responder
### Aliases: ptransform ptransform.colorSpec
### Keywords: colorSpec

### ** Examples

############ Example for sRGB   ###########

# assign the standard sRGB primaries
P = matrix( c(0.64,0.33,NA,  0.3,0.6,NA, 0.15,0.06,NA ), 3, 3, byrow=TRUE )
rownames(P) = c('R','G','B')
P
#   [,1] [,2] [,3]
# R 0.64 0.33   NA
# G 0.30 0.60   NA
# B 0.15 0.06   NA

white = product( D65.1nm, xyz1931.1nm, wave='auto' )
white
#           X        Y        Z
# D65 100.437 105.6708 115.0574

white/sum(white)
#             X         Y         Z
# D65 0.3127269 0.3290232 0.3582499    

# But the sRGB standard D65 is xy=(0.3127,0.3290)
# so when the next line is executed,
# the calculated 3x3 matrix will *NOT* agree with the sRGB standard
y = ptransform( xyz1931.1nm, P, white, digits=Inf )

product( D65.1nm, y, wave='auto' )
#     R G B
# D65 1 1 1      # this is exactly what we want, but the internal 3x3 matrix is a little off

# now repeat, but this time round the white chromaticity to
# xy=(0.3127,0.3290) in order to get the matrix right
y = ptransform( xyz1931.1nm, P, white, digits=4 )

rgb = product( D65.1nm, y, wave='auto' )
rgb
#            R        G        B
# D65 1.000238 1.000053 0.999835   # off in the 4'th digit  (WARN: this is linear RGB)

255 * rgb
#            R        G        B
# D65 255.0607 255.0134 254.9579   # good enough for 8-bit RGB

65535 * rgb
#            R        G        B
# D65 65550.59 65538.44 65524.18   # NOT good enough for 16-bit RGB  

# So for 16-bit RGB, one can get the white RGB right, or the 3x3 matrix right, but not both !


############ Example for ProPhoto RGB   ###########

# assign the standard ProPhoto RGB primaries
P = matrix( c(0.7347,0.2653,NA,  0.1596,0.8404,NA, 0.0366,0.0001,NA ), 3, 3, byrow=TRUE )
rownames(P) = c('R','G','B')
P
#     [,1]   [,2] [,3]
# R 0.7347 0.2653   NA
# G 0.1596 0.8404   NA
# B 0.0366 0.0001   NA

white = product( D50.5nm, xyz1931.5nm, wave='auto' )
white
#            X       Y        Z
# D50 101.2815 105.042 86.67237

white / sum(white)
#             X         Y         Z
# D50 0.3456755 0.3585101 0.2958144  

# but the ProPhoto RGB standard is xy=(0.3457,0.3585);  proceed anyway
y = ptransform( xyz1931.5nm, P, white, digits=Inf )

product( D50.5nm, y, wave='auto' )
#     R G B
# D50 1 1 1     #  this is exactly what we want, but the internal 3x3 matrix is a little off

# the following line is an equivalent way to compute y.
# pass D50.5nm directly as the 'white' argument
y = ptransform( xyz1931.5nm, P, D50.5nm )



