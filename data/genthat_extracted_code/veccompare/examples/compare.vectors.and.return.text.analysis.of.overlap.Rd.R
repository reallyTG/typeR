library(veccompare)


### Name: compare.vectors.and.return.text.analysis.of.overlap
### Title: Create a Markdown report from the output of 'compare.vectors'
### Aliases: compare.vectors.and.return.text.analysis.of.overlap

### ** Examples

example <- compare.vectors.and.return.text.analysis.of.overlap(
    veccompare::example.vectors.list,
    cat_immediately = FALSE,
    draw_venn_diagrams = FALSE
)
cat(example)



