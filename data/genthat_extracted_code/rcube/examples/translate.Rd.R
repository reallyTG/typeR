library(rcube)


### Name: translate
### Title: Translating notation
### Aliases: translate

### ** Examples

cube <- createCube()
cube <- twistCube(cube, moves = translate("U R2 F B R B2 R U2 L B2 R U' D' R2 F R' L B2 U2 F2 "))
# Superflip pattern, https://en.wikipedia.org/wiki/Superflip
plot3dCube(cube)



