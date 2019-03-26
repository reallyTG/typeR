library(GENEAread)


### Name: GRtime
### Title: Date time handling for the GENEAread package.
### Aliases: GRtime as.GRtime

### ** Examples

as.GRtime("00:01")
#format is automatically set
convert.time(1:10)
convert.time(1:10*1000)
#we add a different default format
convert.time(1:10*1000, "%H:%M:%OS3") -> t
t
str(t)
# we override format with our own
format(t, format = "%a %d/%m/%y %H:%M:%OS3")

# plot calls axis.GRtime automatically. Notice
# that the format attribute is used.
plot(t, 1:10)
#strip out the default format
t2 = convert.time(t, format = NULL)
plot(t2, 1:10)

# image plots are a bit more complex

Z = matrix(rnorm(100), 10)
image(x = t, y = t2, z = Z, axes = FALSE)
Axis(x = t, side = 1) #Axis also works
box() #complete the bounding box

# custom axes
plot(t2, 1:10, xaxt = "n")




