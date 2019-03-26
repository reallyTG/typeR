library(respirometry)


### Name: correct_bubble
### Title: Adjust respirometer volume for bubbles
### Aliases: correct_bubble

### ** Examples

correct_bubble(resp_vol = 50, bubble_vol = 10) # a 10 mL bubble makes a huge difference!

correct_bubble(resp_vol = 50, bubble_vol = 1, temp = 10, sal = 0) 
# in calculating MO2, a volume of 63.8 L should be used rather than the true 50 L.




