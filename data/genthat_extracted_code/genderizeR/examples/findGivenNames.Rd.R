library(genderizeR)


### Name: findGivenNames
### Title: Getting gender prediction data for a given text vector.
### Aliases: findGivenNames

### ** Examples

## Not run: 
##D 
##D x = "Tom did play hookey, and he had a very good time. He got back home 
##D      barely in season to help Jim, the small colored boy, saw next-day's wood 
##D      and split the kindlings before supper-at least he was there in time 
##D      to tell his adventures to Jim while Jim did three-fourths of the work. 
##D      Tom's younger brother (or rather half-brother) Sid was already through 
##D      with his part of the work (picking up chips), for he was a quiet boy, 
##D      and had no adventurous, trouble-some ways. While Tom was eating his
##D      supper, and stealing sugar as opportunity offered, Aunt Polly asked 
##D      him questions that were full of guile, and very deep-for she wanted 
##D      to trap him into damaging revealments. Like many other simple-hearted
##D      souls, it was her pet vanity to believe she was endowed with a talent 
##D      for dark and mysterious diplomacy, and she loved to contemplate her 
##D      most transparent devices as marvels of low cunning. 
##D      (from 'Tom Sawyer' by Mark Twain)"
##D 
##D xProcessed = textPrepare(x)
##D 
##D foundNames = findGivenNames(xProcessed, textPrepare = FALSE)
##D foundNames[count > 100]
##D 
##D # (the results can differ due to new, updated data pulled from the API)
##D #    name gender probability count
##D # 1:   jim   male        1.00  2291
##D # 2:  mark   male        1.00  6178
##D # 3: polly female        0.99   191
##D # 4:   tom   male        1.00  3736
##D 
## End(Not run)




