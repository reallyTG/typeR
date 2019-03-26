library(soundgen)


### Name: fade
### Title: Fade
### Aliases: fade

### ** Examples

#' # Fading a real sound: say we want fast attack and slow release
s = soundgen(attack = 0, windowLength = 10,
             sylLen = 500, addSilence = 0)
# playme(s)
# plot(s, type = 'l')
s1 = fade(s, fadeIn = 10, fadeOut = 350,
          samplingRate = 16000, shape = 'cos')
# playme(s1)
# plot(s1, type = 'l')


# Illustration of fade shapes
x = runif(5000, min = -1, max = 1)  # make sure to zero-center input!!!
# plot(x, type = 'l')
y = fade(x, fadeIn = 1000, fadeOut = 0, plot = TRUE)
y = fade(x,
         fadeIn = 1000,
         fadeOut = 1500,
         shape = 'exp',
         plot = TRUE)
y = fade(x,
         fadeIn = 1500,
         fadeOut = 500,
         shape = 'log',
         plot = TRUE)
y = fade(x,
         fadeIn = 1500,
         fadeOut = 500,
         shape = 'log',
         steepness = 8,
         plot = TRUE)
y = fade(x,
         fadeIn = 1000,
         fadeOut = 1500,
         shape = 'cos',
         plot = TRUE)
y = fade(x,
         fadeIn = 1500,
         fadeOut = 500,
         shape = 'logistic',
         steepness = 4,
         plot = TRUE)



