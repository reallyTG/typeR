#############################################################################
##
## Copyright 2016 Novartis Institutes for BioMedical Research Inc.
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
#############################################################################

context("H5T")

test_that("H5T_ENUM works", {
    labels1 <- LETTERS[1:10]
    labels2 <- paste0("B", 1:300)
    enum_test1 <- H5T_ENUM$new(labels=labels1)
    enum_test2<- H5T_ENUM$new(labels=labels2)

    expect_equal(as.character(enum_test1$get_class()), "H5T_ENUM")
    expect_equal(enum_test1$get_size(), 1)
    expect_equal(enum_test2$get_size(), 2)

    expect_equal(enum_test1$get_labels(), labels1)
    expect_equal(enum_test2$get_labels(), labels2)
})

test_that("H5T_COMPOUND works", {
    labels1 <- LETTERS[1:10]
    enum_test1 <- H5T_ENUM$new(labels=labels1)
    cpd_dtypes <-h5types$overview$Type_id
    names(cpd_dtypes) <- h5types$overview$Name
    cpd_test1 <- H5T_COMPOUND$new(labels=names(cpd_dtypes), dtypes=cpd_dtypes)
    cpd_test1_types <- cpd_test1$get_cpd_types()
    cpd_test2 <- H5T_factory(cpd_dtypes, do_copy = TRUE)

    ## check that the factory actually does a copy for all of these, except the last one
    cpd_test2_ids <- unlist(lapply(cpd_test2, function(x) x$id))
    expect_equal(unname(cpd_test2_ids == cpd_dtypes), rep(FALSE, length(cpd_test2_ids)))

    ## test that the give_compound_types returns the same thing as the factory produces
    ## tests the 'equal' function of H5T at the same time
    expect_equal(length(cpd_test1_types), length(cpd_test2))
    eq_res <- logical(length(cpd_test1))
    for(i in seq_along(cpd_test1_types)) {
        eq_res[i] <- cpd_test1_types[[i]]$equal(cpd_test2[[i]])
    }
    expect_true(all(eq_res))

    ## now check that classes are returned correctly
    cpd_test1_classes <- cpd_test1$get_cpd_classes()
    cpd_test2_classes <- unname(do.call("c", lapply(cpd_test2, function(x) x$get_class())))
    expect_equal(cpd_test1_classes, unname(cpd_test2_classes))


    ## also insert a test here that a complex can be created
    ## and on copy is returned as the correct r6 class
    cplx_dt <- H5T_COMPLEX$new()
    expect_true(inherits(cplx_dt$copy(), "H5T_COMPLEX"))
})

test_that("INTEGER", {
    ## get an integer type, set its precision and its sign
    dtype_int <- h5types$H5T_NATIVE_LLONG
    dtype_int$set_precision(16)
    dtype_int$set_size(2)
    dtype_int$set_sign(h5const$H5T_SGN_NONE)
    dtype_int$set_order(h5const$H5T_ORDER_BE)

    expect_true(dtype_int$equal(h5types$H5T_STD_U16BE))

    expect_equal(dtype_int$get_size(), 2)
    expect_equal(dtype_int$get_precision(), 16)
    expect_equal(dtype_int$get_sign(), h5const$H5T_SGN_NONE)
    expect_equal(dtype_int$get_order(), h5const$H5T_ORDER_BE)
})

test_that("FLOAT", {
    ## change a double data type into a float by setting all the important bits
    dtype_float <- h5types$H5T_NATIVE_FLOAT
    dtype_double <- h5types$H5T_NATIVE_DOUBLE

    ## now change the double into a float
    do.call(dtype_double$set_fields, args=dtype_float$get_fields())
    dtype_double$set_ebias(dtype_float$get_ebias())
    dtype_double$set_norm(dtype_float$get_norm())
    dtype_double$set_inpad(dtype_float$get_inpad())
    dtype_double$set_size(dtype_float$get_size())

    expect_true(dtype_double$equal(dtype_float))
})

test_that("native datatypes", {
    int_test <- h5types$H5T_STD_U32BE
    int_test_native_c_type <- int_test$get_native_type()
    expect_true(int_test_native_c_type$equal(h5types$H5T_NATIVE_UINT32))

    ## create a compound type with BE and LE 16 bit integers in it, as well as 64 bit BE and LE
    ## then get a native_c and native_r datatype
    ## compare to the artificially created ones
    cpd_test <- H5T_COMPOUND$new(labels=c("U16LE", "U326BE", "U64LE", "I64BE", "FLOAT"),
                                 dtypes=list(h5types$H5T_STD_U16LE, h5types$H5T_STD_U32BE, h5types$H5T_STD_U64LE, h5types$H5T_STD_I64BE,
                                     h5types$H5T_NATIVE_FLOAT))
    cpd_native_c <- H5T_COMPOUND$new(labels=c("U16LE", "U326BE", "U64LE", "I64BE", "FLOAT"),
                                     dtypes=list(h5types$H5T_NATIVE_UINT16, h5types$H5T_NATIVE_UINT32,
                                     h5types$H5T_NATIVE_UINT64, h5types$H5T_NATIVE_INT64, h5types$H5T_NATIVE_FLOAT),
                                     size=32, offset=c(0, 4, 8, 16, 24))
    cpd_native_r <- H5T_COMPOUND$new(labels=c("U16LE", "U326BE", "U64LE", "I64BE", "FLOAT"),
                                     dtypes=list(h5types$H5T_NATIVE_INT, h5types$H5T_NATIVE_LLONG,
                                     h5types$H5T_NATIVE_LLONG, h5types$H5T_NATIVE_LLONG, h5types$H5T_NATIVE_DOUBLE),
                                     size=40, offset=c(0, 8, 16, 24, 32))

    cpd_test_native_c <- cpd_test$get_native_type()
    expect_true(cpd_test_native_c$equal(cpd_native_c))
    expect_equal(cpd_test_native_c$describe(), cpd_native_c$describe())

})

test_that("Committing a datatype", {
    test_file <- tempfile(fileext=".h5")
    ## open a new one, truncate if it exists
    file.h5 <- H5File$new(test_file, mode="w")

    labels1 <- LETTERS[1:10]
    enum_test1 <- H5T_ENUM$new(labels=labels1)

    file.h5$commit("enum_test", enum_test1)

    ## open it again; check that it is the same
    ## and then check it is committed
    dtype_enum_committed <- file.h5$open("enum_test")

    expect_true(dtype_enum_committed$is_committed())
    expect_true(enum_test1$is_committed())


    file.h5$close_all()
    file.remove(test_file)
})

test_that("Describe", {
    ## no test performed; will just run describe
    ## on all standard types
    overview <- h5types$overview
    for(i in seq_len(nrow(overview))) {
        dtype <- get(overview$Name[i], envir=h5types)
        if(!as.character(dtype$get_class()) %in% c("H5T_REFERENCE", "H5T_TIME", "H5T_OPAQUE")) {
            dtype$describe()
        }
    }

})

test_that("is_vlen", {
    vlen_int <- H5T_VLEN$new(h5types$H5T_NATIVE_INT)
    vlen_string <- H5T_STRING$new(size=Inf)
    nonvlen_string <- H5T_STRING$new(size=2)
    nonvlen_int <- h5types$H5T_NATIVE_INT

    expect_true(vlen_int$is_vlen())
    expect_true(vlen_string$is_vlen())
    expect_true(!nonvlen_int$is_vlen())
    expect_true(!nonvlen_string$is_vlen())

})


test_that("dtype to text", {
    
    
    ## now check that dtype to text to dtype conversion works
#    cpd_test1_round_trip <- text_to_dtype(h5types$H5O_info_t$to_text())
#    expect_true(cpd_test1$equal(cpd_test1_round_trip))
#    text_to_dtype("H5T_COMPOUND { H5T_STD_I32BE \"a\"; H5T_IEEE_F32BE \"b\"; H5T_IEEE_F64BE \"c\"; }")
})
