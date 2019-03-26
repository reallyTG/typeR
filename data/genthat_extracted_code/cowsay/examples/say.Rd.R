library(cowsay)


### Name: say
### Title: Sling messages and warnings with flair
### Aliases: say

### ** Examples

say()
say("what")
say("meow", "cat", what_color = "blue")
say('time')
say('time', "poop", by_color = "cyan", what_color = "pink")

library(jsonlite)
say("arresteddevelopment",
    by = "hypnotoad",
    what_color = c("royalblue1", "tomato2"),
    by_color = c("rainbow", "rainbow"))
say("simpsons",
    what_color = crayon::cyan$bgMagenta,
    by_color = c("salmon1", "springgreen"))
    
say("who you callin chicken", "chicken")
say("ain't that some shit", "poop")
say("icanhazpdf?", "cat")
say("boo!", "pumpkin")
say("hot diggity", "frog")
say("fortune", "spider")
say("fortune", "facecat")
say("fortune", "behindcat")
say("fortune", "smallcat")
say("fortune", "monkey")
say("fortune", "egret")
say("rms", "rms")

# Vary type of output, default calls message()
say("hell no!")
say("hell no!", type="warning")
say("hell no!", type="string")

# Using fortunes
say(what="fortune")
## you don't have to pass anything to the `what` parameter if `fortune` is 
## not null
say(fortune=10)
say(fortune=100)
say(fortune='whatever')
say(fortune=7)
say(fortune=45)

# Using catfacts
# say("catfact", "cat")

# The hypnotoad
say(by="hypnotoad")

# Trilobite
say(by='trilobite')

# Shark
say('Q: What do you call a solitary shark\nA: A lone shark', by='shark')

# Buffalo
say('Q: What do you call a single buffalo?\nA: A buffalonely', by='buffalo')

# Clippy
say(fortune=59, by="clippy")



