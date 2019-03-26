library(textclean)


### Name: replace_email
### Title: Replace Email Addresses
### Aliases: replace_email

### ** Examples

x <- c(
    "fred is fred@foo.com and joe is joe@example.com - but @this is a", 
    "twitter handle for twit@here.com or foo+bar@google.com/fred@foo.fnord", 
    "hello world", 
    NA
)

replace_email(x)
replace_email(x, replacement = '<<EMAIL>>')
replace_email(x, replacement = '<a href="mailto:$1" target="_blank">$1</a>')

## Replacement with a function
replace_email(x, 
    replacement = function(x){
        sprintf('<a href="mailto:%s" target="_blank">%s</a>', x, x)
    }
)


replace_email(x, 
    replacement = function(x){
        gsub('@.+$', ' {{at domain}}', x)
    }
)



