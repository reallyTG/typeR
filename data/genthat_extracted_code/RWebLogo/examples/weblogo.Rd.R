library(RWebLogo)


### Name: weblogo
### Title: Plot a sequence logo
### Aliases: weblogo

### ** Examples

# Make a sequence logo using an external alignment file format
# In this example we'll use the EMBOSS alignment format or msf
# However, you can use any format supported by WebLogo e.g. fasta
fpath = system.file("extdata", "example_data.msf", package="RWebLogo")
weblogo(file.in=fpath)
# Now for an example using an alignment as an R character vector
aln <- c('CCAACCCAA', 'CCAACCCTA', 'AAAGCCTGA', 'TGAACCGGA')
# Simple WebLogo
weblogo(seqs=aln)
# Lets get rid of those ugly error bars and add some text!
weblogo(seqs=aln, errorbars=FALSE, title='Yay, No error bars!',
        fineprint='RWebLogo 1.0', label='1a')
# We can also change the format of the output like this
weblogo(seqs=aln, format='png', resolution=500)
# You can change the axis labels like this
weblogo(seqs=aln, xlabel='My x-axis', ylabel='Awesome bits')
# You get the idea! See ?weblogo for more awesome options!



