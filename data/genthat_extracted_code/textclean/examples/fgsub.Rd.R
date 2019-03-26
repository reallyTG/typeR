library(textclean)


### Name: fgsub
### Title: Replace a Regex with an Functional Operation on the Regex Match
### Aliases: fgsub

### ** Examples

## In this example the regex looks for words that contain a lower case letter 
## followed by the same letter at least 2 more times.  It then extracts these
## words, splits them appart into letters, reverses the string, pastes them
## back together, wraps them with double angle braces, and then puts them back 
## at the original locations.
fgsub(
    x = c(NA, 'df dft sdf', 'sd fdggg sd dfhhh d', 'ddd'),
    pattern = "\\b\\w*([a-z])(\\1{2,})\\w*\\b",
    fun = function(x) {
        paste0('<<', paste(rev(strsplit(x, '')[[1]]), collapse =''), '>>')
    }    
)

## In this example we extract numbers, strip out non-digits, coerce them to 
## numeric, cut them in half, round up to the closest integer, add the commas 
## back, and replace back into the original locations.
fgsub(
    x = c(NA, 'I want 32 grapes', 'he wants 4 ice creams', 
        'they want 1,234,567 dollars'
    ),
    pattern = "[\\d,]+",
    fun = function(x) {
        prettyNum(
            ceiling(as.numeric(gsub('[^0-9]', '', x))/2), 
            big.mark = ','
        )
    }    
)

## In this example we extract leading zeros, convert to an equal number of 
## spaces. 
fgsub(
    x = c(NA, "00:04", "00:08", "00:01", "06:14", "00:02", "00:04"),
    pattern = '^0+',
    fun = function(x) {gsub('0', ' ', x)}
)



