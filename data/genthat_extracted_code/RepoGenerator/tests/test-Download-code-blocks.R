context("Download code blocks")

# get list of data
dataList <- read.csv(system.file('metadata/DataList.csv', package='RepoGenerator'), stringsAsFactors=FALSE, header=TRUE)
creation <- createDownloadText(dataList)


test_that('A character vector was made', {
    expect_is(creation, 'character')
})

test_that('The correct length is output', {
    expect_length(creation, nrow(dataList))
})
