if (FALSE){
    context("Test removing of dlls")

    if (file.exists("tran.dll")){
        rc <- try(dyn.unload("tran.dll"), silent = TRUE);
        unlink("tran.dll");
    }

    test_that("tran.dll exists #1", {
        skip_on_cran();
        options(dpaser.rm.named.parser.dll=TRUE);
        f <- dparse("tran.g");
        expect_true(file.exists(f@env$dll.file));
        gc()

        expect_true(file.exists(f@env$dll.file));

        dll <- f@env$dll.file;
        rm(f);
        gc();
        Sys.sleep(1)

        expect_true(!file.exists(dll));

        f1 <- dparse("tran.g");
        f2 <- dparse("tran.g");

        expect_true(file.exists(dll));
        gc();

        expect_true(file.exists(dll));
        rm(f1);
        gc();

        expect_true(file.exists(dll));

        rm(f2);
        gc();
        Sys.sleep(1)

        expect_true(!file.exists(dll));

        options(dpaser.rm.unnamed.parser.dll=TRUE);

        g <- paste(readLines("tran.g"), collapse="\n");

        f1 <- dparse(g)
        dll.file <- f1@env$dll.file

        expect_true(file.exists(dll.file));

        f2 <- dparse(g)

        rm(f1);
        gc();

        expect_true(file.exists(dll.file));
        rm(f2);
        gc();
        Sys.sleep(1)
        expect_true(!file.exists(dll.file));

        options(dpaser.rm.named.parser.dll=FALSE);

        f <- dparse("tran.g");
        expect_true(file.exists(f@env$dll.file));
        gc()
        expect_true(file.exists(f@env$dll.file));

        dll <- f@env$dll.file;
        rm(f);
        gc()

        expect_true(file.exists(dll));

        options(dpaser.rm.named.parser.dll=TRUE);
        gc()

        expect_true(file.exists(dll));
        f <- dparse("tran.g");
        gc()

        expect_true(file.exists(dll));

        rm(f)
        gc()
        Sys.sleep(1)

        expect_true(!file.exists(dll));
    })
}
