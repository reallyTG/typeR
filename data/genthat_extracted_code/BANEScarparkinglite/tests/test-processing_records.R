context("Processing records")


test_that("Records are filtered correctly with refine", {
    
    load(file.path("data", "raw.rda"))
    
    # Raw records have 16 columns, and this dataframe has 360 rows
    expect_equal(dim(raw), c(360, 16))
    
    
    refined <- refine(raw)
    
    # Refined records have 7 columns, and no duplicate records
    manual <- unique(raw[, c("name", "lastupdate")])
    
    expect_equal(dim(refined), c(nrow(manual), 7))
    expect_equal(names(refined),
                 c("Name", "LastUpdate", "DateUploaded", "Occupancy",
                   "Capacity", "Status", "Proportion"))
    
    
    
    # Check effectiveness of "strictness" parameters
    strict_refined <- refine(raw, max_prop = 0.2, first_upload = TRUE)
    
    strict_manual <- unique(raw[(raw$occupancy/raw$capacity <= 0.2 &
                                     raw$lastupdate < raw$dateuploaded),
                                c("name", "lastupdate")])
    
    expect_equal(nrow(strict_refined), nrow(strict_manual))
})
