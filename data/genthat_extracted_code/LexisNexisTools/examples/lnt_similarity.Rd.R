library(LexisNexisTools)


### Name: lnt_similarity
### Title: Check for highly similar articles.
### Aliases: lnt_similarity
### Keywords: similarity

### ** Examples

# Copy sample file to current wd
lnt_sample()

# Convert raw file to LNToutput object
LNToutput <- lnt_read(lnt_sample())

# Test similarity of articles
duplicates.df <- lnt_similarity(texts = LNToutput@articles$Article,
                                dates = LNToutput@meta$Date,
                                IDs = LNToutput@articles$ID)

# Remove instances with a high relative distance
duplicates.df <- duplicates.df[duplicates.df$rel_dist < 0.2]

# Create three separate data.frames from cleaned LNToutput object
LNToutput <- LNToutput[!LNToutput@meta$ID %in%
                         duplicates.df$ID_duplicate]
meta.df <- LNToutput@meta
articles.df <- LNToutput@articles
paragraphs.df <- LNToutput@paragraphs



