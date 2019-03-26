library(pander)


### Name: pandoc.verbatim.return
### Title: Add verbatim
### Aliases: pandoc.verbatim.return pandoc.verbatim

### ** Examples

# different styles/formats
pandoc.verbatim('FOO')

src <- c('FOO', 'indent', 'BAR' )
pandoc.verbatim(src)
pandoc.verbatim.return(src)
pandoc.verbatim(c('FOOO\nBAR  ', ' I do R'), 'indent')
pandoc.verbatim(c('FOOO\nBAR  ', ' I do R'), 'delim')

# add highlighting and HTML/LaTeX ID and classes (even custom attribute)
pandoc.verbatim(c('cat("FOO")', 'mean(bar)'), 'delim', '.R #MyCode custom_var="10"')



