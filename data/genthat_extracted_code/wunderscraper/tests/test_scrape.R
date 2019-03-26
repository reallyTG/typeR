context('test scrape')

test_that('scrape checks errors', {
    data(zctaRel)
    setApiKey('testing')
    testScheduler <- scheduler()
    zctaRel $RURAL <- log(zctaRel $COPOP) < 10
    expect_error(scrape(testScheduler, c('GEOID', 'ZCTA5'), strata='RURAL', sampleFrame=zctaRel),
                 'strata must remain nested')
    expect_error(scrape(testScheduler, 'GEOID', size=c(1, 1, 1)), 'id must exist for all stages')
    expect_error(scrape(testScheduler, 'GEOID', size=1), 'id of last stage must be identical to "id"')
})
