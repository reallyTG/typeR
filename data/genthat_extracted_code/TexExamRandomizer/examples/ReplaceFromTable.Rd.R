library(TexExamRandomizer)


### Name: ReplaceFromTable
### Title: ReplaceFromTable
### Aliases: ReplaceFromTable

### ** Examples


custom_preambles <- list()
for (i in 1:nrow(TexExamRandomizer::testclass)) {
    custom_preambles <-
        c(
            custom_preambles,
            list(
                TexExamRandomizer::ReplaceFromTable(
                    TexExamRandomizer::testdoc$preamble,
                    table = TexExamRandomizer::testclass,
                    tableRow = i,
                    columnNames = c("Class", "Roll.Number", "Nickname"),
                    commandNames = c("class", "rollnumber", "nickname")
                )
            )

        )

}



