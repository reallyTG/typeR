library(monkeylearn)


### Name: monkeylearn_extract
### Title: monkeylearn_extract
### Aliases: monkeylearn_extract

### ** Examples

## Not run: 
##D text <- "In the 19th century, the major European powers had gone to great lengths
##D to maintain a balance of power throughout Europe, resulting in the existence of
##D  a complex network of political and military alliances throughout the continent by 1900.[7]
##D   These had started in 1815, with the Holy Alliance between Prussia, Russia, and Austria.
##D   Then, in October 1873, German Chancellor Otto von Bismarck negotiated the League of
##D    the Three Emperors (German: Dreikaiserbund) between the monarchs of Austria-Hungary,
##D     Russia and Germany."
##D output <- monkeylearn_extract(request = text)
##D output
##D # example with parameters
##D text <- "A panel of Goldman Sachs employees spent a recent Tuesday night at the
##D Columbia University faculty club trying to convince a packed room of potential
##D recruits that Wall Street, not Silicon Valley, was the place to be for computer
##D scientists.\n\n The Goldman employees knew they had an uphill battle. They were
##D fighting against perceptions of Wall Street as boring and regulation-bound and
##D Silicon Valley as the promised land of flip-flops, beanbag chairs and million-dollar
##D stock options.\n\n Their argument to the room of technologically inclined students
##D was that Wall Street was where they could find far more challenging, diverse and,
##D yes, lucrative jobs working on some of the worlds most difficult technical problems."
##D 
##D output <- monkeylearn_extract(text,
##D                               extractor_id = "ex_y7BPYzNG",
##D                               params = list(max_keywords = 3,
##D                                             use_company_names = 1))
##D attr(output, "headers")
## End(Not run)



