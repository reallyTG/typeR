library(textclean)


### Name: replace_time
### Title: Replace Time Stamps With Words
### Aliases: replace_time

### ** Examples

x <- c(
    NA, '12:47 to "twelve forty-seven" and also 8:35:02', 
    'what about 14:24.5', 'And then 99:99:99?'
)

## Textual: Word version
replace_time(x)

## Normalization: <<TIME>>
replace_time(x, replacement = '<<TIME>>')

## Normalization: hh:mm:ss or hh:mm
replace_time(x, replacement = function(y){
        z <- unlist(strsplit(y, '[:.]'))
        z[1] <- 'hh'
        z[2] <- 'mm'
        if(!is.na(z[3])) z[3] <- 'ss'
        glue_collapse(z, ':')
    }
)

## Textual: Word version (forced seconds)
replace_time(x, replacement = function(y){
        z <- replace_number(unlist(strsplit(y, '[:.]')))
        z[3] <- paste0('and ', ifelse(is.na(z[3]), '0', z[3]), ' seconds')
        paste(z, collapse = ' ')
    }
)
 
## Normalization: hh:mm:ss
replace_time(x, replacement = function(y){
        z <- unlist(strsplit(y, '[:.]'))
        z[1] <- 'hh'
        z[2] <- 'mm'
        z[3] <- 'ss'
        glue_collapse(z, ':')
    }
)



