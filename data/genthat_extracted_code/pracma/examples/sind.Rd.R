library(pracma)


### Name: sind,cosd,tand, etc.
### Title: Trigonometric Functions in Degrees
### Aliases: sind cosd tand cotd asind acosd atand acotd secd cscd asecd
###   acscd atan2d
### Keywords: math

### ** Examples

# sind(x) and cosd(x) are accurate for x which are multiples
# of 90 and 180 degrees, while tand(x) is problematic.

x <- seq(0, 720, by = 90)
sind(x)                     # 0  1  0 -1  0  1  0 -1  0
cosd(x)                     # 1  0 -1  0  1  0 -1  0  1
tand(x)                     # 0  Inf  0  -Inf  0  Inf  0  -Inf  0
cotd(x)                     # Inf  0  -Inf  0  Inf  0  -Inf  0  Inf

x <- seq(5, 85, by = 20)
asind(sind(x))              # 5 25 45 65 85
asecd(sec(x))
tand(x)                     # 0.08748866  0.46630766  1.00000000  ...
atan2d(1, 1)                # 45



