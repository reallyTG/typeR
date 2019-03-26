context('renamefrom')

## -----------------------------------------------------------------------------
## PRELIM
## -----------------------------------------------------------------------------

## set up data
df <- tibble::tibble(state = c('Texas','Louisiana','Massachusetts',
                               'Florida','Oregon','Montana',
                               'Washington','Arkansas','Tennessee',
                               'Mississippi','Utah','Alabama',
                               'Kentucky','Maine','Michigan',
                               'California','Illinois','Delaware',
                               'Idaho','North Carolina','Nebraska',
                               'Maryland','Virginia','Pennsylvania',
                               'Rhode Island','South Carolina','Iowa',
                               'New Hampshire','Kansas','Nevada',
                               'South Dakota','Colorado','Arizona',
                               'Alaska','New York','Oklahoma',
                               'Wisconsin','Wyoming','Connecticut',
                               'Missouri','Minnesota','Ohio',
                               'Georgia','New Jersey','Vermont',
                               'District of Columbia','North Dakota',
                               'New Mexico','West Virginia','Indiana',
                               'Hawaii'),
                     y = seq(1:51))

## second dataframe with different capitalization
df_2 <- df
names(df_2) <- c('State','Y')

## set up crosswalk
crosswalk_file <- tibble::tibble(raw_1 = c('state', 'y'),
                                 clean_1 = c('stname', 'new_y'),
                                 label_1 = c('Full Name', 'New Y'),
                                 raw_2 = c('State', 'y'),
                                 clean_2 = c('stname', 'new_y'))

## -----------------------------------------------------------------------------
## TESTS
## -----------------------------------------------------------------------------

## basic rename with labels
new_df <- renamefrom(df, crosswalk_file, raw_1, clean_1, label_1)

test_that('Does not output data.frame/tbl/tbl_df', {

    expect_is(new_df, 'data.frame')

})

test_that('Failed to properly rename columns', {

    expect_equal(names(new_df), c('stname','new_y'))

})

test_that('Failed to label columns correctly', {

    expect_equal(unlist(labelled::var_label(new_df), use.names = FALSE),
                        c('Full Name', 'New Y'))

})

## check if rename still works with default case_ignore
new_df <- renamefrom(df_2, crosswalk_file, raw_2, clean_2)

test_that('Failed to properly rename columns when ignoring case', {

    expect_equal(names(new_df), c('stname','new_y'))

})

## check if extra column dropped when case match should be exact
new_df <- renamefrom(df_2, crosswalk_file, raw_2, clean_2, case_ignore = FALSE)

test_that('Failed to drop extra column based on exact name match', {

    expect_equal(names(new_df), c('stname'))

})

## check if extra column kept when case match should be exact,
## but drop_extra is false
new_df <- renamefrom(df_2, crosswalk_file, raw_2, clean_2,
                     case_ignore = FALSE, drop_extra = FALSE)

test_that('Failed to keep extra column based on exact name match', {

    expect_equal(names(new_df), c('stname', 'Y'))

})
